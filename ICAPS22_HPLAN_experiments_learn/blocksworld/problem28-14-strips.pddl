( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b57 - block
    b492 - block
    b877 - block
    b207 - block
    b109 - block
    b783 - block
    b547 - block
    b24 - block
    b936 - block
    b922 - block
    b885 - block
    b32 - block
    b379 - block
    b521 - block
    b191 - block
    b299 - block
    b624 - block
    b272 - block
    b309 - block
    b880 - block
    b275 - block
    b2 - block
    b169 - block
    b989 - block
    b479 - block
    b444 - block
    b965 - block
    b897 - block
    b350 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b57 )
    ( on b492 b57 )
    ( on b877 b492 )
    ( on b207 b877 )
    ( on b109 b207 )
    ( on b783 b109 )
    ( on b547 b783 )
    ( on b24 b547 )
    ( on b936 b24 )
    ( on b922 b936 )
    ( on b885 b922 )
    ( on b32 b885 )
    ( on b379 b32 )
    ( on b521 b379 )
    ( on b191 b521 )
    ( on b299 b191 )
    ( on b624 b299 )
    ( on b272 b624 )
    ( on b309 b272 )
    ( on b880 b309 )
    ( on b275 b880 )
    ( on b2 b275 )
    ( on b169 b2 )
    ( on b989 b169 )
    ( on b479 b989 )
    ( on b444 b479 )
    ( on b965 b444 )
    ( on b897 b965 )
    ( on b350 b897 )
    ( clear b350 )
  )
  ( :goal
    ( and
      ( clear b57 )
    )
  )
)
