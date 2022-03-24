( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b494 - block
    b766 - block
    b801 - block
    b242 - block
    b851 - block
    b907 - block
    b632 - block
    b100 - block
    b43 - block
    b203 - block
    b336 - block
    b155 - block
    b643 - block
    b383 - block
    b47 - block
    b564 - block
    b525 - block
    b268 - block
    b289 - block
    b249 - block
    b186 - block
    b126 - block
    b594 - block
    b129 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b494 )
    ( on b766 b494 )
    ( on b801 b766 )
    ( on b242 b801 )
    ( on b851 b242 )
    ( on b907 b851 )
    ( on b632 b907 )
    ( on b100 b632 )
    ( on b43 b100 )
    ( on b203 b43 )
    ( on b336 b203 )
    ( on b155 b336 )
    ( on b643 b155 )
    ( on b383 b643 )
    ( on b47 b383 )
    ( on b564 b47 )
    ( on b525 b564 )
    ( on b268 b525 )
    ( on b289 b268 )
    ( on b249 b289 )
    ( on b186 b249 )
    ( on b126 b186 )
    ( on b594 b126 )
    ( on b129 b594 )
    ( clear b129 )
  )
  ( :goal
    ( and
      ( clear b494 )
    )
  )
)
