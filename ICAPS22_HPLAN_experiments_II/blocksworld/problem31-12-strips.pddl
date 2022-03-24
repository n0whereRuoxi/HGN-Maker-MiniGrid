( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b272 - block
    b251 - block
    b350 - block
    b814 - block
    b489 - block
    b6 - block
    b815 - block
    b509 - block
    b629 - block
    b894 - block
    b364 - block
    b209 - block
    b819 - block
    b284 - block
    b552 - block
    b956 - block
    b360 - block
    b454 - block
    b949 - block
    b461 - block
    b807 - block
    b689 - block
    b788 - block
    b647 - block
    b20 - block
    b57 - block
    b35 - block
    b810 - block
    b117 - block
    b477 - block
    b786 - block
    b748 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b272 )
    ( on b251 b272 )
    ( on b350 b251 )
    ( on b814 b350 )
    ( on b489 b814 )
    ( on b6 b489 )
    ( on b815 b6 )
    ( on b509 b815 )
    ( on b629 b509 )
    ( on b894 b629 )
    ( on b364 b894 )
    ( on b209 b364 )
    ( on b819 b209 )
    ( on b284 b819 )
    ( on b552 b284 )
    ( on b956 b552 )
    ( on b360 b956 )
    ( on b454 b360 )
    ( on b949 b454 )
    ( on b461 b949 )
    ( on b807 b461 )
    ( on b689 b807 )
    ( on b788 b689 )
    ( on b647 b788 )
    ( on b20 b647 )
    ( on b57 b20 )
    ( on b35 b57 )
    ( on b810 b35 )
    ( on b117 b810 )
    ( on b477 b117 )
    ( on b786 b477 )
    ( on b748 b786 )
    ( clear b748 )
  )
  ( :goal
    ( and
      ( clear b272 )
    )
  )
)
