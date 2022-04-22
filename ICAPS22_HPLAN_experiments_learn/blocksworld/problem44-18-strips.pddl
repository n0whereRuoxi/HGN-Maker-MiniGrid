( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b44 - block
    b228 - block
    b917 - block
    b789 - block
    b401 - block
    b927 - block
    b142 - block
    b900 - block
    b803 - block
    b351 - block
    b512 - block
    b235 - block
    b96 - block
    b489 - block
    b813 - block
    b265 - block
    b6 - block
    b386 - block
    b502 - block
    b815 - block
    b83 - block
    b838 - block
    b387 - block
    b106 - block
    b84 - block
    b35 - block
    b621 - block
    b234 - block
    b591 - block
    b800 - block
    b737 - block
    b315 - block
    b665 - block
    b49 - block
    b630 - block
    b416 - block
    b942 - block
    b133 - block
    b59 - block
    b221 - block
    b140 - block
    b882 - block
    b242 - block
    b345 - block
    b543 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b44 )
    ( on b228 b44 )
    ( on b917 b228 )
    ( on b789 b917 )
    ( on b401 b789 )
    ( on b927 b401 )
    ( on b142 b927 )
    ( on b900 b142 )
    ( on b803 b900 )
    ( on b351 b803 )
    ( on b512 b351 )
    ( on b235 b512 )
    ( on b96 b235 )
    ( on b489 b96 )
    ( on b813 b489 )
    ( on b265 b813 )
    ( on b6 b265 )
    ( on b386 b6 )
    ( on b502 b386 )
    ( on b815 b502 )
    ( on b83 b815 )
    ( on b838 b83 )
    ( on b387 b838 )
    ( on b106 b387 )
    ( on b84 b106 )
    ( on b35 b84 )
    ( on b621 b35 )
    ( on b234 b621 )
    ( on b591 b234 )
    ( on b800 b591 )
    ( on b737 b800 )
    ( on b315 b737 )
    ( on b665 b315 )
    ( on b49 b665 )
    ( on b630 b49 )
    ( on b416 b630 )
    ( on b942 b416 )
    ( on b133 b942 )
    ( on b59 b133 )
    ( on b221 b59 )
    ( on b140 b221 )
    ( on b882 b140 )
    ( on b242 b882 )
    ( on b345 b242 )
    ( on b543 b345 )
    ( clear b543 )
  )
  ( :goal
    ( and
      ( clear b44 )
    )
  )
)
