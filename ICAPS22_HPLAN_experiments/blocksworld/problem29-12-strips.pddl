( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b179 - block
    b843 - block
    b429 - block
    b198 - block
    b453 - block
    b999 - block
    b862 - block
    b136 - block
    b896 - block
    b444 - block
    b562 - block
    b738 - block
    b899 - block
    b541 - block
    b713 - block
    b642 - block
    b249 - block
    b715 - block
    b8 - block
    b76 - block
    b998 - block
    b349 - block
    b387 - block
    b887 - block
    b383 - block
    b913 - block
    b96 - block
    b368 - block
    b679 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b179 b424 )
    ( on b843 b179 )
    ( on b429 b843 )
    ( on b198 b429 )
    ( on b453 b198 )
    ( on b999 b453 )
    ( on b862 b999 )
    ( on b136 b862 )
    ( on b896 b136 )
    ( on b444 b896 )
    ( on b562 b444 )
    ( on b738 b562 )
    ( on b899 b738 )
    ( on b541 b899 )
    ( on b713 b541 )
    ( on b642 b713 )
    ( on b249 b642 )
    ( on b715 b249 )
    ( on b8 b715 )
    ( on b76 b8 )
    ( on b998 b76 )
    ( on b349 b998 )
    ( on b387 b349 )
    ( on b887 b387 )
    ( on b383 b887 )
    ( on b913 b383 )
    ( on b96 b913 )
    ( on b368 b96 )
    ( on b679 b368 )
    ( clear b679 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
