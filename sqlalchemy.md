# [docs url](https://docs.sqlalchemy.org/en/13/index.html)

### imports, base
```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from database_setup import Base, Restaurant, MenuItem

engine = create_engine('sqlite:///basename.db')
Base.metadata.bind=engine
DBSession = sessionmaker(bind = engine)
session = DBSession()
```

### CREATE
```python
item = ItemClass(name = "Name")
session.add(item)
sesssion.commit()
```

### READ
```python
item = session.query(ItemClass).first()
item.name
```

### UPDATE
```python
items = session.query(ItemClass).filter_by(name= 'Name')
for item in items:
    print (item.id)
    
item = session.query(ItemClass).filter_by(id=8).one()
item.name = 'NewName'
session.add(item)
session.commit()
```

# DELETE
```python
item = session.query(ItemClass).filter_by(name = 'Name').one()
session.delete(item)
session.commit()
```
