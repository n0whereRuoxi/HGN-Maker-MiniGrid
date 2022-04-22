( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b783 - block
    b254 - block
    b376 - block
    b673 - block
    b283 - block
    b528 - block
    b23 - block
    b179 - block
    b119 - block
    b585 - block
    b496 - block
    b722 - block
    b451 - block
    b212 - block
    b790 - block
    b700 - block
    b152 - block
    b990 - block
    b564 - block
    b521 - block
    b683 - block
    b31 - block
    b386 - block
    b657 - block
    b460 - block
    b611 - block
    b59 - block
    b883 - block
    b305 - block
    b363 - block
    b269 - block
    b889 - block
    b624 - block
    b497 - block
    b542 - block
    b782 - block
    b853 - block
    b784 - block
    b291 - block
    b73 - block
    b731 - block
    b951 - block
    b699 - block
    b754 - block
    b404 - block
    b205 - block
    b321 - block
    b137 - block
    b112 - block
    b619 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b783 )
    ( on b254 b783 )
    ( on b376 b254 )
    ( on b673 b376 )
    ( on b283 b673 )
    ( on b528 b283 )
    ( on b23 b528 )
    ( on b179 b23 )
    ( on b119 b179 )
    ( on b585 b119 )
    ( on b496 b585 )
    ( on b722 b496 )
    ( on b451 b722 )
    ( on b212 b451 )
    ( on b790 b212 )
    ( on b700 b790 )
    ( on b152 b700 )
    ( on b990 b152 )
    ( on b564 b990 )
    ( on b521 b564 )
    ( on b683 b521 )
    ( on b31 b683 )
    ( on b386 b31 )
    ( on b657 b386 )
    ( on b460 b657 )
    ( on b611 b460 )
    ( on b59 b611 )
    ( on b883 b59 )
    ( on b305 b883 )
    ( on b363 b305 )
    ( on b269 b363 )
    ( on b889 b269 )
    ( on b624 b889 )
    ( on b497 b624 )
    ( on b542 b497 )
    ( on b782 b542 )
    ( on b853 b782 )
    ( on b784 b853 )
    ( on b291 b784 )
    ( on b73 b291 )
    ( on b731 b73 )
    ( on b951 b731 )
    ( on b699 b951 )
    ( on b754 b699 )
    ( on b404 b754 )
    ( on b205 b404 )
    ( on b321 b205 )
    ( on b137 b321 )
    ( on b112 b137 )
    ( on b619 b112 )
    ( clear b619 )
  )
  ( :goal
    ( and
      ( clear b783 )
    )
  )
)
