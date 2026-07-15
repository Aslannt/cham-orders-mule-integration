%dw 2.0
output application/json

var orders = vars.confirmedOrders default []
---
{
    source: "CHAM_ORDERS",
    generatedAt: vars.generatedAt,
    correlationId: correlationId,
    orders: orders map ((order) -> {
        orderId: order.id,
        customerId: order.customerId,
        status: order.status,
        total: order.total,
        items: (order.items default []) map ((item) -> {
            sku: item.productSku,
            name: item.productName,
            quantity: item.quantity,
            unitPrice: item.unitPrice,
            subtotal: item.subtotal
        })
    })
}
