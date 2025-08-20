import os
import pandas as pd
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

load_dotenv()

# Parâmetros de Conexão com as variáveis de ambiente
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST", "localhost")
port = os.getenv("DB_PORT", "5432")
dbname = os.getenv("DB_NAME")

# string de conexão
engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{dbname}")

# Caminho do arquivo CSV
csv_path = "data/shipments.csv"


# Carregar o CSV em um DataFrame do pandas
df = pd.read_csv(csv_path)

print(df.head())
print("Linhas carregadas:", len(df))

# Enviar para staging
df.to_sql("stg_dados", schema="newfase", con=engine, if_exists="replace", index=False)

print("Dados carregados na tabela staging com sucesso!")

# Validação
with engine.connect() as conn:
    result = conn.execute(text("SELECT COUNT(*) FROM newfase.stg_dados"))
    print(f"Número total de linhas no banco:", result.scalar())
