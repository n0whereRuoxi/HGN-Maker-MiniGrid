( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b378 - block
    b317 - block
    b467 - block
    b158 - block
    b671 - block
    b861 - block
    b515 - block
    b899 - block
    b57 - block
    b947 - block
    b175 - block
    b529 - block
    b990 - block
    b858 - block
    b639 - block
    b567 - block
    b311 - block
    b297 - block
    b55 - block
    b877 - block
    b556 - block
    b371 - block
    b125 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b378 )
    ( on b317 b378 )
    ( on b467 b317 )
    ( on b158 b467 )
    ( on b671 b158 )
    ( on b861 b671 )
    ( on b515 b861 )
    ( on b899 b515 )
    ( on b57 b899 )
    ( on b947 b57 )
    ( on b175 b947 )
    ( on b529 b175 )
    ( on b990 b529 )
    ( on b858 b990 )
    ( on b639 b858 )
    ( on b567 b639 )
    ( on b311 b567 )
    ( on b297 b311 )
    ( on b55 b297 )
    ( on b877 b55 )
    ( on b556 b877 )
    ( on b371 b556 )
    ( on b125 b371 )
    ( clear b125 )
  )
  ( :tasks
    ( Make-22Pile b317 b467 b158 b671 b861 b515 b899 b57 b947 b175 b529 b990 b858 b639 b567 b311 b297 b55 b877 b556 b371 b125 )
  )
)
