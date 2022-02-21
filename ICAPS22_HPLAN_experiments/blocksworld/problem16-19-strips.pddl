( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b851 - block
    b421 - block
    b849 - block
    b863 - block
    b21 - block
    b180 - block
    b617 - block
    b573 - block
    b275 - block
    b193 - block
    b688 - block
    b219 - block
    b908 - block
    b473 - block
    b125 - block
    b843 - block
    b76 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b851 )
    ( on b421 b851 )
    ( on b849 b421 )
    ( on b863 b849 )
    ( on b21 b863 )
    ( on b180 b21 )
    ( on b617 b180 )
    ( on b573 b617 )
    ( on b275 b573 )
    ( on b193 b275 )
    ( on b688 b193 )
    ( on b219 b688 )
    ( on b908 b219 )
    ( on b473 b908 )
    ( on b125 b473 )
    ( on b843 b125 )
    ( on b76 b843 )
    ( clear b76 )
  )
  ( :goal
    ( and
      ( clear b851 )
    )
  )
)
