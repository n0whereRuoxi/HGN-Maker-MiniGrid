( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b104 - block
    b426 - block
    b72 - block
    b771 - block
    b655 - block
    b748 - block
    b60 - block
    b700 - block
    b596 - block
    b299 - block
    b940 - block
    b188 - block
    b235 - block
    b931 - block
    b476 - block
    b358 - block
    b217 - block
    b430 - block
    b522 - block
    b901 - block
    b713 - block
    b556 - block
    b849 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b104 )
    ( on b426 b104 )
    ( on b72 b426 )
    ( on b771 b72 )
    ( on b655 b771 )
    ( on b748 b655 )
    ( on b60 b748 )
    ( on b700 b60 )
    ( on b596 b700 )
    ( on b299 b596 )
    ( on b940 b299 )
    ( on b188 b940 )
    ( on b235 b188 )
    ( on b931 b235 )
    ( on b476 b931 )
    ( on b358 b476 )
    ( on b217 b358 )
    ( on b430 b217 )
    ( on b522 b430 )
    ( on b901 b522 )
    ( on b713 b901 )
    ( on b556 b713 )
    ( on b849 b556 )
    ( on b760 b849 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b104 )
    )
  )
)
