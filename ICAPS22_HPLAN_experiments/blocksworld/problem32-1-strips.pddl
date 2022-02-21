( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b34 - block
    b589 - block
    b353 - block
    b341 - block
    b750 - block
    b776 - block
    b932 - block
    b711 - block
    b257 - block
    b372 - block
    b822 - block
    b523 - block
    b460 - block
    b3 - block
    b156 - block
    b208 - block
    b266 - block
    b881 - block
    b86 - block
    b976 - block
    b325 - block
    b408 - block
    b309 - block
    b844 - block
    b791 - block
    b832 - block
    b847 - block
    b597 - block
    b954 - block
    b505 - block
    b147 - block
    b213 - block
    b25 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b34 )
    ( on b589 b34 )
    ( on b353 b589 )
    ( on b341 b353 )
    ( on b750 b341 )
    ( on b776 b750 )
    ( on b932 b776 )
    ( on b711 b932 )
    ( on b257 b711 )
    ( on b372 b257 )
    ( on b822 b372 )
    ( on b523 b822 )
    ( on b460 b523 )
    ( on b3 b460 )
    ( on b156 b3 )
    ( on b208 b156 )
    ( on b266 b208 )
    ( on b881 b266 )
    ( on b86 b881 )
    ( on b976 b86 )
    ( on b325 b976 )
    ( on b408 b325 )
    ( on b309 b408 )
    ( on b844 b309 )
    ( on b791 b844 )
    ( on b832 b791 )
    ( on b847 b832 )
    ( on b597 b847 )
    ( on b954 b597 )
    ( on b505 b954 )
    ( on b147 b505 )
    ( on b213 b147 )
    ( on b25 b213 )
    ( clear b25 )
  )
  ( :goal
    ( and
      ( clear b34 )
    )
  )
)
