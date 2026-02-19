# Project: Trade Finance Blockchain Explorer | Developer: Abdul Samad | FRS Standard Compliance
from pydantic_settings import BaseSettings
from typing import List


class Settings(BaseSettings):
    # App
    APP_NAME: str = "Trade Finance Blockchain Explorer"
    DEBUG: bool = False
    API_V1_PREFIX: str = "/api/v1"
    
    # Database
    DATABASE_URL: str = "sqlite:///./test.db"  # Default fallback
    
    # JWT
    SECRET_KEY: str
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 15
    
    # S3
    AWS_ACCESS_KEY_ID: str | None = None
    AWS_SECRET_ACCESS_KEY: str | None = None
    AWS_REGION: str = "us-east-1"
    S3_BUCKET_NAME: str | None = None
    S3_ENDPOINT_URL: str | None = None
    S3_PUBLIC_ENDPOINT_URL: str | None = None
    
    # CORS
    CORS_ORIGINS: List[str] = ["*"]  # Allow all for demo showcase
    
    class Config:
        env_file = ".env"
        case_sensitive = True

    def __init__(self, **values):
        super().__init__(**values)
        import os
        # Fallback for Netlify/Neon automatic env vars
        if not self.DATABASE_URL and os.getenv("NETLIFY_DATABASE_URL"):
            self.DATABASE_URL = os.getenv("NETLIFY_DATABASE_URL")

settings = Settings()
