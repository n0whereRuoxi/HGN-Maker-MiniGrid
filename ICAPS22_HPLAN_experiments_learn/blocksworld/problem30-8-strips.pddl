( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b142 - block
    b374 - block
    b121 - block
    b316 - block
    b691 - block
    b99 - block
    b340 - block
    b286 - block
    b65 - block
    b670 - block
    b999 - block
    b763 - block
    b765 - block
    b206 - block
    b430 - block
    b300 - block
    b723 - block
    b972 - block
    b481 - block
    b779 - block
    b562 - block
    b526 - block
    b211 - block
    b101 - block
    b850 - block
    b452 - block
    b416 - block
    b603 - block
    b14 - block
    b556 - block
    b230 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b142 )
    ( on b374 b142 )
    ( on b121 b374 )
    ( on b316 b121 )
    ( on b691 b316 )
    ( on b99 b691 )
    ( on b340 b99 )
    ( on b286 b340 )
    ( on b65 b286 )
    ( on b670 b65 )
    ( on b999 b670 )
    ( on b763 b999 )
    ( on b765 b763 )
    ( on b206 b765 )
    ( on b430 b206 )
    ( on b300 b430 )
    ( on b723 b300 )
    ( on b972 b723 )
    ( on b481 b972 )
    ( on b779 b481 )
    ( on b562 b779 )
    ( on b526 b562 )
    ( on b211 b526 )
    ( on b101 b211 )
    ( on b850 b101 )
    ( on b452 b850 )
    ( on b416 b452 )
    ( on b603 b416 )
    ( on b14 b603 )
    ( on b556 b14 )
    ( on b230 b556 )
    ( clear b230 )
  )
  ( :goal
    ( and
      ( clear b142 )
    )
  )
)
