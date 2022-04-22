( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b548 - block
    b62 - block
    b301 - block
    b530 - block
    b467 - block
    b487 - block
    b260 - block
    b946 - block
    b887 - block
    b820 - block
    b114 - block
    b263 - block
    b538 - block
    b969 - block
    b654 - block
    b166 - block
    b667 - block
    b976 - block
    b894 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b548 )
    ( on b62 b548 )
    ( on b301 b62 )
    ( on b530 b301 )
    ( on b467 b530 )
    ( on b487 b467 )
    ( on b260 b487 )
    ( on b946 b260 )
    ( on b887 b946 )
    ( on b820 b887 )
    ( on b114 b820 )
    ( on b263 b114 )
    ( on b538 b263 )
    ( on b969 b538 )
    ( on b654 b969 )
    ( on b166 b654 )
    ( on b667 b166 )
    ( on b976 b667 )
    ( on b894 b976 )
    ( clear b894 )
  )
  ( :goal
    ( and
      ( clear b548 )
    )
  )
)
