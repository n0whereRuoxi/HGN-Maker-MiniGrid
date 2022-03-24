( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b7 - block
    b70 - block
    b395 - block
    b401 - block
    b704 - block
    b235 - block
    b710 - block
    b709 - block
    b393 - block
    b685 - block
    b347 - block
    b793 - block
    b121 - block
    b863 - block
    b79 - block
    b308 - block
    b25 - block
    b507 - block
    b133 - block
    b361 - block
    b586 - block
    b820 - block
    b549 - block
    b995 - block
    b856 - block
    b617 - block
    b373 - block
    b228 - block
    b354 - block
    b726 - block
    b578 - block
    b150 - block
    b482 - block
    b885 - block
    b625 - block
    b798 - block
    b610 - block
    b715 - block
    b766 - block
    b315 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b7 )
    ( on b70 b7 )
    ( on b395 b70 )
    ( on b401 b395 )
    ( on b704 b401 )
    ( on b235 b704 )
    ( on b710 b235 )
    ( on b709 b710 )
    ( on b393 b709 )
    ( on b685 b393 )
    ( on b347 b685 )
    ( on b793 b347 )
    ( on b121 b793 )
    ( on b863 b121 )
    ( on b79 b863 )
    ( on b308 b79 )
    ( on b25 b308 )
    ( on b507 b25 )
    ( on b133 b507 )
    ( on b361 b133 )
    ( on b586 b361 )
    ( on b820 b586 )
    ( on b549 b820 )
    ( on b995 b549 )
    ( on b856 b995 )
    ( on b617 b856 )
    ( on b373 b617 )
    ( on b228 b373 )
    ( on b354 b228 )
    ( on b726 b354 )
    ( on b578 b726 )
    ( on b150 b578 )
    ( on b482 b150 )
    ( on b885 b482 )
    ( on b625 b885 )
    ( on b798 b625 )
    ( on b610 b798 )
    ( on b715 b610 )
    ( on b766 b715 )
    ( on b315 b766 )
    ( on b424 b315 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b7 )
    )
  )
)
