( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b202 - block
    b352 - block
    b805 - block
    b538 - block
    b880 - block
    b423 - block
    b820 - block
    b818 - block
    b623 - block
    b766 - block
    b214 - block
    b624 - block
    b69 - block
    b960 - block
    b708 - block
    b79 - block
    b77 - block
    b786 - block
    b434 - block
    b14 - block
    b13 - block
    b338 - block
    b482 - block
    b267 - block
    b378 - block
    b979 - block
    b562 - block
    b557 - block
    b891 - block
    b128 - block
    b218 - block
    b989 - block
    b132 - block
    b120 - block
    b376 - block
    b911 - block
    b688 - block
    b210 - block
    b430 - block
    b994 - block
    b594 - block
    b95 - block
    b477 - block
    b600 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b202 )
    ( on b352 b202 )
    ( on b805 b352 )
    ( on b538 b805 )
    ( on b880 b538 )
    ( on b423 b880 )
    ( on b820 b423 )
    ( on b818 b820 )
    ( on b623 b818 )
    ( on b766 b623 )
    ( on b214 b766 )
    ( on b624 b214 )
    ( on b69 b624 )
    ( on b960 b69 )
    ( on b708 b960 )
    ( on b79 b708 )
    ( on b77 b79 )
    ( on b786 b77 )
    ( on b434 b786 )
    ( on b14 b434 )
    ( on b13 b14 )
    ( on b338 b13 )
    ( on b482 b338 )
    ( on b267 b482 )
    ( on b378 b267 )
    ( on b979 b378 )
    ( on b562 b979 )
    ( on b557 b562 )
    ( on b891 b557 )
    ( on b128 b891 )
    ( on b218 b128 )
    ( on b989 b218 )
    ( on b132 b989 )
    ( on b120 b132 )
    ( on b376 b120 )
    ( on b911 b376 )
    ( on b688 b911 )
    ( on b210 b688 )
    ( on b430 b210 )
    ( on b994 b430 )
    ( on b594 b994 )
    ( on b95 b594 )
    ( on b477 b95 )
    ( on b600 b477 )
    ( clear b600 )
  )
  ( :goal
    ( and
      ( clear b202 )
    )
  )
)
