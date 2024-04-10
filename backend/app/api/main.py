from fastapi import APIRouter

from app.api.routes import items, login, users, utils, suggestion, products

api_router = APIRouter()
api_router.include_router(login.router, tags=["login"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(utils.router, prefix="/utils", tags=["utils"])
api_router.include_router(items.router, prefix="/items", tags=["items"])
api_router.include_router(suggestion.router, prefix="/suggestion", tags=["search-suggestion"])
api_router.include_router(products.router, prefix="/products", tags=["products"])
