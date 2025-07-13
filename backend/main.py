# CareCrate Backend API
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="CareCrate API", version="1.0.0")

# Configure CORS for Flutter app
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure this properly in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Welcome to CareCrate API"}

@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "CareCrate API"}

# API routes will be added here
# from app.api import auth, packages, orders

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
