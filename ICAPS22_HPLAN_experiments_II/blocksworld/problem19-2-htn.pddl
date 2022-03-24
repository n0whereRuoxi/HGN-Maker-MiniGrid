( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b438 - block
    b65 - block
    b459 - block
    b93 - block
    b355 - block
    b505 - block
    b532 - block
    b385 - block
    b934 - block
    b820 - block
    b47 - block
    b392 - block
    b26 - block
    b169 - block
    b514 - block
    b683 - block
    b297 - block
    b675 - block
    b429 - block
    b751 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b438 )
    ( on b65 b438 )
    ( on b459 b65 )
    ( on b93 b459 )
    ( on b355 b93 )
    ( on b505 b355 )
    ( on b532 b505 )
    ( on b385 b532 )
    ( on b934 b385 )
    ( on b820 b934 )
    ( on b47 b820 )
    ( on b392 b47 )
    ( on b26 b392 )
    ( on b169 b26 )
    ( on b514 b169 )
    ( on b683 b514 )
    ( on b297 b683 )
    ( on b675 b297 )
    ( on b429 b675 )
    ( on b751 b429 )
    ( clear b751 )
  )
  ( :tasks
    ( Make-19Pile b65 b459 b93 b355 b505 b532 b385 b934 b820 b47 b392 b26 b169 b514 b683 b297 b675 b429 b751 )
  )
)
