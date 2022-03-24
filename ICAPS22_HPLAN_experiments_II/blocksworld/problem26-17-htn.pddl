( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b631 - block
    b165 - block
    b567 - block
    b914 - block
    b303 - block
    b572 - block
    b711 - block
    b787 - block
    b283 - block
    b136 - block
    b120 - block
    b284 - block
    b905 - block
    b129 - block
    b220 - block
    b70 - block
    b584 - block
    b647 - block
    b257 - block
    b126 - block
    b145 - block
    b97 - block
    b401 - block
    b127 - block
    b211 - block
    b468 - block
    b210 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b631 )
    ( on b165 b631 )
    ( on b567 b165 )
    ( on b914 b567 )
    ( on b303 b914 )
    ( on b572 b303 )
    ( on b711 b572 )
    ( on b787 b711 )
    ( on b283 b787 )
    ( on b136 b283 )
    ( on b120 b136 )
    ( on b284 b120 )
    ( on b905 b284 )
    ( on b129 b905 )
    ( on b220 b129 )
    ( on b70 b220 )
    ( on b584 b70 )
    ( on b647 b584 )
    ( on b257 b647 )
    ( on b126 b257 )
    ( on b145 b126 )
    ( on b97 b145 )
    ( on b401 b97 )
    ( on b127 b401 )
    ( on b211 b127 )
    ( on b468 b211 )
    ( on b210 b468 )
    ( clear b210 )
  )
  ( :tasks
    ( Make-26Pile b165 b567 b914 b303 b572 b711 b787 b283 b136 b120 b284 b905 b129 b220 b70 b584 b647 b257 b126 b145 b97 b401 b127 b211 b468 b210 )
  )
)
