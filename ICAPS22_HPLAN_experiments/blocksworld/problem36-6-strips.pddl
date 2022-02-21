( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b793 - block
    b765 - block
    b567 - block
    b880 - block
    b71 - block
    b67 - block
    b589 - block
    b992 - block
    b18 - block
    b945 - block
    b997 - block
    b239 - block
    b672 - block
    b308 - block
    b741 - block
    b42 - block
    b481 - block
    b906 - block
    b256 - block
    b477 - block
    b275 - block
    b507 - block
    b37 - block
    b857 - block
    b234 - block
    b393 - block
    b751 - block
    b377 - block
    b534 - block
    b274 - block
    b791 - block
    b319 - block
    b261 - block
    b469 - block
    b718 - block
    b989 - block
    b869 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b793 )
    ( on b765 b793 )
    ( on b567 b765 )
    ( on b880 b567 )
    ( on b71 b880 )
    ( on b67 b71 )
    ( on b589 b67 )
    ( on b992 b589 )
    ( on b18 b992 )
    ( on b945 b18 )
    ( on b997 b945 )
    ( on b239 b997 )
    ( on b672 b239 )
    ( on b308 b672 )
    ( on b741 b308 )
    ( on b42 b741 )
    ( on b481 b42 )
    ( on b906 b481 )
    ( on b256 b906 )
    ( on b477 b256 )
    ( on b275 b477 )
    ( on b507 b275 )
    ( on b37 b507 )
    ( on b857 b37 )
    ( on b234 b857 )
    ( on b393 b234 )
    ( on b751 b393 )
    ( on b377 b751 )
    ( on b534 b377 )
    ( on b274 b534 )
    ( on b791 b274 )
    ( on b319 b791 )
    ( on b261 b319 )
    ( on b469 b261 )
    ( on b718 b469 )
    ( on b989 b718 )
    ( on b869 b989 )
    ( clear b869 )
  )
  ( :goal
    ( and
      ( clear b793 )
    )
  )
)
