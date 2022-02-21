( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b215 - block
    b501 - block
    b59 - block
    b682 - block
    b253 - block
    b457 - block
    b346 - block
    b830 - block
    b386 - block
    b395 - block
    b857 - block
    b814 - block
    b317 - block
    b946 - block
    b980 - block
    b260 - block
    b185 - block
    b336 - block
    b674 - block
    b667 - block
    b772 - block
    b508 - block
    b803 - block
    b249 - block
    b464 - block
    b426 - block
    b462 - block
    b362 - block
    b525 - block
    b924 - block
    b370 - block
    b348 - block
    b572 - block
    b173 - block
    b685 - block
    b140 - block
    b312 - block
    b675 - block
    b986 - block
    b248 - block
    b416 - block
    b128 - block
    b819 - block
    b851 - block
    b709 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b215 )
    ( on b501 b215 )
    ( on b59 b501 )
    ( on b682 b59 )
    ( on b253 b682 )
    ( on b457 b253 )
    ( on b346 b457 )
    ( on b830 b346 )
    ( on b386 b830 )
    ( on b395 b386 )
    ( on b857 b395 )
    ( on b814 b857 )
    ( on b317 b814 )
    ( on b946 b317 )
    ( on b980 b946 )
    ( on b260 b980 )
    ( on b185 b260 )
    ( on b336 b185 )
    ( on b674 b336 )
    ( on b667 b674 )
    ( on b772 b667 )
    ( on b508 b772 )
    ( on b803 b508 )
    ( on b249 b803 )
    ( on b464 b249 )
    ( on b426 b464 )
    ( on b462 b426 )
    ( on b362 b462 )
    ( on b525 b362 )
    ( on b924 b525 )
    ( on b370 b924 )
    ( on b348 b370 )
    ( on b572 b348 )
    ( on b173 b572 )
    ( on b685 b173 )
    ( on b140 b685 )
    ( on b312 b140 )
    ( on b675 b312 )
    ( on b986 b675 )
    ( on b248 b986 )
    ( on b416 b248 )
    ( on b128 b416 )
    ( on b819 b128 )
    ( on b851 b819 )
    ( on b709 b851 )
    ( clear b709 )
  )
  ( :goal
    ( and
      ( clear b215 )
    )
  )
)
