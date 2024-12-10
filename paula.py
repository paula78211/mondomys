from pymongo import MongoClient

# Conectar al servidor de MongoDB
cliente = MongoClient('mongodb+srv://root:12345@clustergratis.xldjn.mongodb.net/')
base_de_datos = cliente['mi_base_de_datos']

# Crear o acceder a las colecciones
coleccion_comentarios = base_de_datos['Comentarios']
coleccion_productos_calificados = base_de_datos['ProductosCalificados']

# Insertar un comentario
comentario = {
    'texto': 'Excelente producto, muy recomendado!',
    'calificacion': 5,
    'cliente_id': 'cliente123'
}
coleccion_comentarios.insert_one(comentario)

# Insertar un producto calificado
producto_calificado = {
    'producto_id': 'producto001',
    'calificacion': 4.5,
    'comentarios': [
        {'comentario_id': 'comentario001', 'calificacion': 5},
        {'comentario_id': 'comentario002', 'calificacion': 4}
    ]
}
coleccion_productos_calificados.insert_one(producto_calificado)

# Consultar comentarios de un cliente
cliente_id = 'cliente123'
comentarios = coleccion_comentarios.find({'cliente_id': cliente_id})
for comentario in comentarios:
    print(comentario)

# Consultar la calificación promedio de un producto
producto_id = 'producto001'
producto = coleccion_productos_calificados.find_one({'producto_id': producto_id})
if producto:
    calificaciones = [comentario['calificacion'] for comentario in producto['comentarios']]
    calificacion_promedio = sum(calificaciones) / len(calificaciones)
    print(f"Calificación promedio del producto {producto_id}: {calificacion_promedio}")

# Actualizar un comentario
coleccion_comentarios.update_one(
    {'_id': 'comentario001'},
    {'$set': {'calificacion': 4}}
)

# Eliminar un comentario
coleccion_comentarios.delete_one({'_id': 'comentario001'})

