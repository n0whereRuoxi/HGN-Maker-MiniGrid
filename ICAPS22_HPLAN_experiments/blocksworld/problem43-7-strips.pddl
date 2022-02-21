( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b664 - block
    b763 - block
    b362 - block
    b987 - block
    b373 - block
    b725 - block
    b955 - block
    b309 - block
    b63 - block
    b641 - block
    b825 - block
    b472 - block
    b685 - block
    b995 - block
    b891 - block
    b227 - block
    b59 - block
    b903 - block
    b489 - block
    b207 - block
    b764 - block
    b585 - block
    b953 - block
    b532 - block
    b794 - block
    b770 - block
    b279 - block
    b465 - block
    b143 - block
    b576 - block
    b88 - block
    b261 - block
    b396 - block
    b863 - block
    b594 - block
    b601 - block
    b531 - block
    b511 - block
    b564 - block
    b654 - block
    b31 - block
    b514 - block
    b185 - block
    b743 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b664 )
    ( on b763 b664 )
    ( on b362 b763 )
    ( on b987 b362 )
    ( on b373 b987 )
    ( on b725 b373 )
    ( on b955 b725 )
    ( on b309 b955 )
    ( on b63 b309 )
    ( on b641 b63 )
    ( on b825 b641 )
    ( on b472 b825 )
    ( on b685 b472 )
    ( on b995 b685 )
    ( on b891 b995 )
    ( on b227 b891 )
    ( on b59 b227 )
    ( on b903 b59 )
    ( on b489 b903 )
    ( on b207 b489 )
    ( on b764 b207 )
    ( on b585 b764 )
    ( on b953 b585 )
    ( on b532 b953 )
    ( on b794 b532 )
    ( on b770 b794 )
    ( on b279 b770 )
    ( on b465 b279 )
    ( on b143 b465 )
    ( on b576 b143 )
    ( on b88 b576 )
    ( on b261 b88 )
    ( on b396 b261 )
    ( on b863 b396 )
    ( on b594 b863 )
    ( on b601 b594 )
    ( on b531 b601 )
    ( on b511 b531 )
    ( on b564 b511 )
    ( on b654 b564 )
    ( on b31 b654 )
    ( on b514 b31 )
    ( on b185 b514 )
    ( on b743 b185 )
    ( clear b743 )
  )
  ( :goal
    ( and
      ( clear b664 )
    )
  )
)
