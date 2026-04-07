from flask import jsonify

def register_routes(app):

    @app.route('/api/products', methods=['POST'])
    def create_product():
        return {"message": "Product created"}, 201

    @app.route('/api/companies/<int:company_id>/alerts/low-stock')
    def low_stock(company_id):
        return {
            "alerts": [],
            "total_alerts": 0
        }