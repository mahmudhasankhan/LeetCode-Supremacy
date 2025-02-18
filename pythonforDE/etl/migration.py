import pandas as pd
import psycopg2
import openpyxl
import logging
import os
import time

from dotenv import load_dotenv, find_dotenv
from tqdm import tqdm


# const
my_path = "./files/"

# conn params
db_credentials = {
    'user': os.environ['USER'],
    'password': os.environ['PASSWORD'],
    'host': os.environ['HOST'],
    'port': os.environ['PORT'],
    'database': os.environ['DATABASE'] 
}


# cleaning dataframes
def clean_df(df):
    # Extract the header from row 4 (index 3)
    header = df.iloc[3].tolist()

    # Assign the header to the DataFrame
    df.columns = header

    # Remove rows above the data starting row (row 6, index 5)
    df = df[5:].reset_index(drop=True)

    # Remove rows where 'Sl' column contains 'Grand Total'
    if 'SL' in df.columns:
        df = df[~df['SL'].str.strip().str.lower().eq('grand total')]

    # Drop the 'Sl' column
    if 'SL' in df.columns:
        df = df.drop(columns=['SL'])
    return df

#single file excel process 
def process_excel(df):
    # Map DataFrame columns to table columns
    column_mapping = {
        'Office': 'office',
        'Project': 'project',
        'Department': 'department',
        'Asset Serial/Code': 'existing_asset_serial',
        'Reg. Date (Format: MM/DD/YYYY)': 'registration_date',
        'Purchase Date (Format: MM/DD/YYYY)': 'purchase_date',
        'Warrenty\nDate (If any)': 'warranty_date',
        'Voucher Number (If Any)': 'voucher_number',
        'Asset Name': 'asset_name',
        'Asset Group': 'asset_group',
        'Asset Category': 'asset_category',
        'Asset Subcategory': 'asset_sub_category',
        'Item Specification/\nIMEI/SL': 'item_specification',
        'Unit of Measurement': 'unit_of_measurement',
        'Measurement (Only Required for Land and Building, will be blank for others)': 'measurement',
        'Building (Location)': 'building',
        'Floor (location)': 'floor',
        'Room (if available)': 'room',
        'Assigned User (PIN)\n(Enter only PIN)': 'assigned_user',
        'Particulars': 'particulars',
        'Lifetime (Months)': 'lifetime',
        'Remaining Lifetime (Months)': 'remaining_lifetime',
        'Purchase Price': 'purchase_price',
        'Total Addition': 'total_addition',
        'Total Unit Price': 'total_unit_price',
        'Accumulated Depreciation': 'accumulated_depreciation',
        'Written Down Value': 'written_down_value',
        'Salvage Value': 'salvage_value',
        'Acquisition Type (Spot Purchase)': 'acquisition_type',
        'Depreciation Process (Straight Line)': 'depreciation_process',
        'Depreciation Rate': 'depreciation_rate',
        'Vendor/ Supplier (This Value is mandatory. If No vnedor found then show "Migrated Vendor")': 'vendor',
        'Remarks': 'remarks',
        'Filename': 'file_name'
    }

    # Rename DataFrame columns
    df = df.rename(columns=column_mapping)

    # Replace NaN with None (to represent SQL NULL)
    df = df.where(pd.notnull(df), None)

    return df

def insert_into_postgresql(df, connection_params):
    try:
        # Connect to PostgreSQL
        conn = psycopg2.connect(**connection_params)
        cursor = conn.cursor()

        # Insert data into the table
        for _, row in df.iterrows():
            values = tuple(row)
            placeholders = ', '.join(['%s'] * len(row))
            query = f"""
            INSERT INTO hofa_mig_data_dump ({', '.join(df.columns)})
            VALUES ({placeholders})
            """
            cursor.execute(query, values)

        # Commit and close connection
        conn.commit()
        cursor.close()
        conn.close()

    except psycopg2.OperationalError as e:
        logging.error("Connecting to the database")
        print(f"Error connecting to the database: {e}")

def process_multiple_excels(filenames: str, conn_params):
    # iterate over the files
    logging.info("Iterating over files")
    for file in tqdm(filenames, desc="Processing files"):
        df = pd.read_excel(os.path.join(my_path, file), dtype=str, header=None)

        # cleaning the df
        
        logging.info(f"cleaning {file}")
        df = clean_df(df)
        df['Filename'] = file
        logging.info(f"processing {file}")
        df = process_excel(df)
        logging.info(f"Migrating data from {file} to postgres server")
        insert_into_postgresql(df, conn_params)

def main():
    _ = load_dotenv(find_dotenv())
    logging.basicConfig(level=logging.INFO,
                        format="%(asctime)s %(levelname)s %(message)s",
                        datefmt="%Y-%m-%d %H:%M:%S",
                        filename="./logs/migration.log")
    start_time = time.time()
    filenames = [f for f in os.listdir(my_path) if os.path.isfile(os.path.join(my_path, f))]
    process_multiple_excels(filenames, db_credentials)
    elapsed = (time.time() - start_time) / 60

    print(f'Total elapsed time: {elapsed:.2f} min')
    logging.info(f'Total elapsed time: {elapsed:.2f} min')


if __name__ == "__main__":
    main()

