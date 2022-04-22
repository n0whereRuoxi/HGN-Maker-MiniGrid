( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b605 - block
    b291 - block
    b487 - block
    b991 - block
    b802 - block
    b671 - block
    b886 - block
    b286 - block
    b371 - block
    b189 - block
    b267 - block
    b356 - block
    b115 - block
    b92 - block
    b156 - block
    b389 - block
    b536 - block
    b779 - block
    b138 - block
    b211 - block
    b693 - block
    b306 - block
    b531 - block
    b803 - block
    b610 - block
    b594 - block
    b915 - block
    b259 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b605 )
    ( on b291 b605 )
    ( on b487 b291 )
    ( on b991 b487 )
    ( on b802 b991 )
    ( on b671 b802 )
    ( on b886 b671 )
    ( on b286 b886 )
    ( on b371 b286 )
    ( on b189 b371 )
    ( on b267 b189 )
    ( on b356 b267 )
    ( on b115 b356 )
    ( on b92 b115 )
    ( on b156 b92 )
    ( on b389 b156 )
    ( on b536 b389 )
    ( on b779 b536 )
    ( on b138 b779 )
    ( on b211 b138 )
    ( on b693 b211 )
    ( on b306 b693 )
    ( on b531 b306 )
    ( on b803 b531 )
    ( on b610 b803 )
    ( on b594 b610 )
    ( on b915 b594 )
    ( on b259 b915 )
    ( clear b259 )
  )
  ( :goal
    ( and
      ( clear b605 )
    )
  )
)
