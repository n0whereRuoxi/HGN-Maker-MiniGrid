( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b564 - block
    b30 - block
    b789 - block
    b375 - block
    b769 - block
    b850 - block
    b621 - block
    b344 - block
    b516 - block
    b310 - block
    b992 - block
    b465 - block
    b55 - block
    b541 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b564 )
    ( on b30 b564 )
    ( on b789 b30 )
    ( on b375 b789 )
    ( on b769 b375 )
    ( on b850 b769 )
    ( on b621 b850 )
    ( on b344 b621 )
    ( on b516 b344 )
    ( on b310 b516 )
    ( on b992 b310 )
    ( on b465 b992 )
    ( on b55 b465 )
    ( on b541 b55 )
    ( on b946 b541 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b564 )
    )
  )
)
