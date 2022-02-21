( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b725 - block
    b843 - block
    b907 - block
    b63 - block
    b515 - block
    b224 - block
    b282 - block
    b430 - block
    b962 - block
    b832 - block
    b626 - block
    b717 - block
    b28 - block
    b634 - block
    b673 - block
    b958 - block
    b899 - block
    b748 - block
    b541 - block
    b85 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b843 b725 )
    ( on b907 b843 )
    ( on b63 b907 )
    ( on b515 b63 )
    ( on b224 b515 )
    ( on b282 b224 )
    ( on b430 b282 )
    ( on b962 b430 )
    ( on b832 b962 )
    ( on b626 b832 )
    ( on b717 b626 )
    ( on b28 b717 )
    ( on b634 b28 )
    ( on b673 b634 )
    ( on b958 b673 )
    ( on b899 b958 )
    ( on b748 b899 )
    ( on b541 b748 )
    ( on b85 b541 )
    ( clear b85 )
  )
  ( :goal
    ( and
      ( clear b725 )
    )
  )
)
