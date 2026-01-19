import time
import logging
import os


LOG_INTERVAL = int(os.getenv("LOG_INTERVAL","10"))
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')
logging.info(f"Service started with interval: {LOG_INTERVAL}s")

while True:
    logging.info("DevOps Service is running...")
    time.sleep(LOG_INTERVAL)
