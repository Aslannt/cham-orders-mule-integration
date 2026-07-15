%dw 2.0
output application/java

fun invalidItem(item) =
    item == null
    or item.productSku == null
    or item.productName == null
    or item.quantity == null
    or item.unitPrice == null
    or item.subtotal == null

fun invalidOrder(order) =
    order == null
    or order.id == null
    or order.customerId == null
    or order.status != "CONFIRMED"
    or order.total == null
    or order.items == null
    or sizeOf((order.items default []) filter ((item) -> invalidItem(item))) > 0

var orders = vars.confirmedOrders default []
---
sizeOf(orders filter ((order) -> invalidOrder(order))) > 0
