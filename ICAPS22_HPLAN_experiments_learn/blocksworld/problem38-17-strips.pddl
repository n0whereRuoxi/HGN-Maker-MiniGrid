( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b172 - block
    b134 - block
    b484 - block
    b897 - block
    b981 - block
    b549 - block
    b529 - block
    b241 - block
    b721 - block
    b101 - block
    b445 - block
    b126 - block
    b442 - block
    b307 - block
    b505 - block
    b755 - block
    b350 - block
    b210 - block
    b750 - block
    b867 - block
    b630 - block
    b327 - block
    b945 - block
    b978 - block
    b974 - block
    b698 - block
    b848 - block
    b386 - block
    b45 - block
    b345 - block
    b652 - block
    b22 - block
    b992 - block
    b284 - block
    b674 - block
    b250 - block
    b237 - block
    b171 - block
    b793 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b172 )
    ( on b134 b172 )
    ( on b484 b134 )
    ( on b897 b484 )
    ( on b981 b897 )
    ( on b549 b981 )
    ( on b529 b549 )
    ( on b241 b529 )
    ( on b721 b241 )
    ( on b101 b721 )
    ( on b445 b101 )
    ( on b126 b445 )
    ( on b442 b126 )
    ( on b307 b442 )
    ( on b505 b307 )
    ( on b755 b505 )
    ( on b350 b755 )
    ( on b210 b350 )
    ( on b750 b210 )
    ( on b867 b750 )
    ( on b630 b867 )
    ( on b327 b630 )
    ( on b945 b327 )
    ( on b978 b945 )
    ( on b974 b978 )
    ( on b698 b974 )
    ( on b848 b698 )
    ( on b386 b848 )
    ( on b45 b386 )
    ( on b345 b45 )
    ( on b652 b345 )
    ( on b22 b652 )
    ( on b992 b22 )
    ( on b284 b992 )
    ( on b674 b284 )
    ( on b250 b674 )
    ( on b237 b250 )
    ( on b171 b237 )
    ( on b793 b171 )
    ( clear b793 )
  )
  ( :goal
    ( and
      ( clear b172 )
    )
  )
)
