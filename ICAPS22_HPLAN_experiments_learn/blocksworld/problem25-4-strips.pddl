( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b393 - block
    b861 - block
    b806 - block
    b91 - block
    b482 - block
    b290 - block
    b430 - block
    b998 - block
    b771 - block
    b140 - block
    b444 - block
    b29 - block
    b545 - block
    b808 - block
    b635 - block
    b784 - block
    b813 - block
    b458 - block
    b366 - block
    b15 - block
    b982 - block
    b7 - block
    b162 - block
    b798 - block
    b294 - block
    b163 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b393 )
    ( on b861 b393 )
    ( on b806 b861 )
    ( on b91 b806 )
    ( on b482 b91 )
    ( on b290 b482 )
    ( on b430 b290 )
    ( on b998 b430 )
    ( on b771 b998 )
    ( on b140 b771 )
    ( on b444 b140 )
    ( on b29 b444 )
    ( on b545 b29 )
    ( on b808 b545 )
    ( on b635 b808 )
    ( on b784 b635 )
    ( on b813 b784 )
    ( on b458 b813 )
    ( on b366 b458 )
    ( on b15 b366 )
    ( on b982 b15 )
    ( on b7 b982 )
    ( on b162 b7 )
    ( on b798 b162 )
    ( on b294 b798 )
    ( on b163 b294 )
    ( clear b163 )
  )
  ( :goal
    ( and
      ( clear b393 )
    )
  )
)
