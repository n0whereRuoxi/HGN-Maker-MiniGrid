( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b432 - block
    b744 - block
    b9 - block
    b392 - block
    b368 - block
    b86 - block
    b210 - block
    b632 - block
    b356 - block
    b741 - block
    b662 - block
    b402 - block
    b183 - block
    b205 - block
    b304 - block
    b431 - block
    b781 - block
    b496 - block
    b157 - block
    b694 - block
    b799 - block
    b49 - block
    b975 - block
    b34 - block
    b645 - block
    b866 - block
    b649 - block
    b251 - block
    b130 - block
    b13 - block
    b699 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b432 )
    ( on b744 b432 )
    ( on b9 b744 )
    ( on b392 b9 )
    ( on b368 b392 )
    ( on b86 b368 )
    ( on b210 b86 )
    ( on b632 b210 )
    ( on b356 b632 )
    ( on b741 b356 )
    ( on b662 b741 )
    ( on b402 b662 )
    ( on b183 b402 )
    ( on b205 b183 )
    ( on b304 b205 )
    ( on b431 b304 )
    ( on b781 b431 )
    ( on b496 b781 )
    ( on b157 b496 )
    ( on b694 b157 )
    ( on b799 b694 )
    ( on b49 b799 )
    ( on b975 b49 )
    ( on b34 b975 )
    ( on b645 b34 )
    ( on b866 b645 )
    ( on b649 b866 )
    ( on b251 b649 )
    ( on b130 b251 )
    ( on b13 b130 )
    ( on b699 b13 )
    ( clear b699 )
  )
  ( :goal
    ( and
      ( clear b432 )
    )
  )
)
