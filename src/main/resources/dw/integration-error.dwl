%dw 2.0
output application/json
---
{
    code: vars.errorCode,
    message: vars.errorMessage,
    timestamp: now(),
    path: attributes.requestPath default "/api/v1/order-sync",
    correlationId: correlationId,
    fieldErrors: {}
}
