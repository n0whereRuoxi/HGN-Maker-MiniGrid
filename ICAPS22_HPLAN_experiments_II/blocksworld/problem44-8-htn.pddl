( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b95 - block
    b711 - block
    b152 - block
    b426 - block
    b1 - block
    b771 - block
    b656 - block
    b628 - block
    b783 - block
    b178 - block
    b34 - block
    b595 - block
    b954 - block
    b921 - block
    b739 - block
    b865 - block
    b397 - block
    b521 - block
    b121 - block
    b725 - block
    b315 - block
    b298 - block
    b440 - block
    b170 - block
    b151 - block
    b447 - block
    b441 - block
    b400 - block
    b200 - block
    b540 - block
    b475 - block
    b525 - block
    b538 - block
    b453 - block
    b758 - block
    b715 - block
    b381 - block
    b872 - block
    b444 - block
    b641 - block
    b356 - block
    b713 - block
    b419 - block
    b722 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b95 )
    ( on b711 b95 )
    ( on b152 b711 )
    ( on b426 b152 )
    ( on b1 b426 )
    ( on b771 b1 )
    ( on b656 b771 )
    ( on b628 b656 )
    ( on b783 b628 )
    ( on b178 b783 )
    ( on b34 b178 )
    ( on b595 b34 )
    ( on b954 b595 )
    ( on b921 b954 )
    ( on b739 b921 )
    ( on b865 b739 )
    ( on b397 b865 )
    ( on b521 b397 )
    ( on b121 b521 )
    ( on b725 b121 )
    ( on b315 b725 )
    ( on b298 b315 )
    ( on b440 b298 )
    ( on b170 b440 )
    ( on b151 b170 )
    ( on b447 b151 )
    ( on b441 b447 )
    ( on b400 b441 )
    ( on b200 b400 )
    ( on b540 b200 )
    ( on b475 b540 )
    ( on b525 b475 )
    ( on b538 b525 )
    ( on b453 b538 )
    ( on b758 b453 )
    ( on b715 b758 )
    ( on b381 b715 )
    ( on b872 b381 )
    ( on b444 b872 )
    ( on b641 b444 )
    ( on b356 b641 )
    ( on b713 b356 )
    ( on b419 b713 )
    ( on b722 b419 )
    ( on b512 b722 )
    ( clear b512 )
  )
  ( :tasks
    ( Make-44Pile b711 b152 b426 b1 b771 b656 b628 b783 b178 b34 b595 b954 b921 b739 b865 b397 b521 b121 b725 b315 b298 b440 b170 b151 b447 b441 b400 b200 b540 b475 b525 b538 b453 b758 b715 b381 b872 b444 b641 b356 b713 b419 b722 b512 )
  )
)
