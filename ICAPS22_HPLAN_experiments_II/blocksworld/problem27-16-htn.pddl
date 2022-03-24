( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b484 - block
    b568 - block
    b908 - block
    b348 - block
    b916 - block
    b89 - block
    b968 - block
    b5 - block
    b800 - block
    b664 - block
    b342 - block
    b115 - block
    b190 - block
    b534 - block
    b111 - block
    b236 - block
    b879 - block
    b99 - block
    b117 - block
    b789 - block
    b263 - block
    b65 - block
    b445 - block
    b257 - block
    b337 - block
    b328 - block
    b255 - block
    b849 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b484 )
    ( on b568 b484 )
    ( on b908 b568 )
    ( on b348 b908 )
    ( on b916 b348 )
    ( on b89 b916 )
    ( on b968 b89 )
    ( on b5 b968 )
    ( on b800 b5 )
    ( on b664 b800 )
    ( on b342 b664 )
    ( on b115 b342 )
    ( on b190 b115 )
    ( on b534 b190 )
    ( on b111 b534 )
    ( on b236 b111 )
    ( on b879 b236 )
    ( on b99 b879 )
    ( on b117 b99 )
    ( on b789 b117 )
    ( on b263 b789 )
    ( on b65 b263 )
    ( on b445 b65 )
    ( on b257 b445 )
    ( on b337 b257 )
    ( on b328 b337 )
    ( on b255 b328 )
    ( on b849 b255 )
    ( clear b849 )
  )
  ( :tasks
    ( Make-27Pile b568 b908 b348 b916 b89 b968 b5 b800 b664 b342 b115 b190 b534 b111 b236 b879 b99 b117 b789 b263 b65 b445 b257 b337 b328 b255 b849 )
  )
)
