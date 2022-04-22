( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b910 - block
    b659 - block
    b382 - block
    b479 - block
    b735 - block
    b627 - block
    b509 - block
    b938 - block
    b103 - block
    b657 - block
    b965 - block
    b577 - block
    b831 - block
    b767 - block
    b994 - block
    b172 - block
    b138 - block
    b220 - block
    b394 - block
    b907 - block
    b975 - block
    b349 - block
    b131 - block
    b425 - block
    b496 - block
    b520 - block
    b822 - block
    b530 - block
    b927 - block
    b10 - block
    b183 - block
    b178 - block
    b672 - block
    b184 - block
    b405 - block
    b510 - block
    b121 - block
    b687 - block
    b693 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b910 )
    ( on b659 b910 )
    ( on b382 b659 )
    ( on b479 b382 )
    ( on b735 b479 )
    ( on b627 b735 )
    ( on b509 b627 )
    ( on b938 b509 )
    ( on b103 b938 )
    ( on b657 b103 )
    ( on b965 b657 )
    ( on b577 b965 )
    ( on b831 b577 )
    ( on b767 b831 )
    ( on b994 b767 )
    ( on b172 b994 )
    ( on b138 b172 )
    ( on b220 b138 )
    ( on b394 b220 )
    ( on b907 b394 )
    ( on b975 b907 )
    ( on b349 b975 )
    ( on b131 b349 )
    ( on b425 b131 )
    ( on b496 b425 )
    ( on b520 b496 )
    ( on b822 b520 )
    ( on b530 b822 )
    ( on b927 b530 )
    ( on b10 b927 )
    ( on b183 b10 )
    ( on b178 b183 )
    ( on b672 b178 )
    ( on b184 b672 )
    ( on b405 b184 )
    ( on b510 b405 )
    ( on b121 b510 )
    ( on b687 b121 )
    ( on b693 b687 )
    ( clear b693 )
  )
  ( :goal
    ( and
      ( clear b910 )
    )
  )
)
