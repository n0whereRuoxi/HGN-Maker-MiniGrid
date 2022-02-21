( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b849 - block
    b564 - block
    b128 - block
    b371 - block
    b942 - block
    b752 - block
    b909 - block
    b563 - block
    b989 - block
    b301 - block
    b943 - block
    b931 - block
    b593 - block
    b80 - block
    b316 - block
    b50 - block
    b286 - block
    b436 - block
    b507 - block
    b188 - block
    b594 - block
    b3 - block
    b449 - block
    b351 - block
    b703 - block
    b559 - block
    b768 - block
    b542 - block
    b189 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b849 )
    ( on b564 b849 )
    ( on b128 b564 )
    ( on b371 b128 )
    ( on b942 b371 )
    ( on b752 b942 )
    ( on b909 b752 )
    ( on b563 b909 )
    ( on b989 b563 )
    ( on b301 b989 )
    ( on b943 b301 )
    ( on b931 b943 )
    ( on b593 b931 )
    ( on b80 b593 )
    ( on b316 b80 )
    ( on b50 b316 )
    ( on b286 b50 )
    ( on b436 b286 )
    ( on b507 b436 )
    ( on b188 b507 )
    ( on b594 b188 )
    ( on b3 b594 )
    ( on b449 b3 )
    ( on b351 b449 )
    ( on b703 b351 )
    ( on b559 b703 )
    ( on b768 b559 )
    ( on b542 b768 )
    ( on b189 b542 )
    ( on b381 b189 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b849 )
    )
  )
)
