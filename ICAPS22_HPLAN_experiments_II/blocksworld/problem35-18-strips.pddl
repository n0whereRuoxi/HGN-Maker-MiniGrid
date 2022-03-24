( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b479 - block
    b73 - block
    b919 - block
    b662 - block
    b129 - block
    b934 - block
    b464 - block
    b920 - block
    b360 - block
    b836 - block
    b107 - block
    b29 - block
    b91 - block
    b871 - block
    b215 - block
    b244 - block
    b252 - block
    b762 - block
    b706 - block
    b108 - block
    b66 - block
    b191 - block
    b768 - block
    b765 - block
    b352 - block
    b229 - block
    b395 - block
    b331 - block
    b691 - block
    b642 - block
    b376 - block
    b831 - block
    b232 - block
    b907 - block
    b54 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b479 b521 )
    ( on b73 b479 )
    ( on b919 b73 )
    ( on b662 b919 )
    ( on b129 b662 )
    ( on b934 b129 )
    ( on b464 b934 )
    ( on b920 b464 )
    ( on b360 b920 )
    ( on b836 b360 )
    ( on b107 b836 )
    ( on b29 b107 )
    ( on b91 b29 )
    ( on b871 b91 )
    ( on b215 b871 )
    ( on b244 b215 )
    ( on b252 b244 )
    ( on b762 b252 )
    ( on b706 b762 )
    ( on b108 b706 )
    ( on b66 b108 )
    ( on b191 b66 )
    ( on b768 b191 )
    ( on b765 b768 )
    ( on b352 b765 )
    ( on b229 b352 )
    ( on b395 b229 )
    ( on b331 b395 )
    ( on b691 b331 )
    ( on b642 b691 )
    ( on b376 b642 )
    ( on b831 b376 )
    ( on b232 b831 )
    ( on b907 b232 )
    ( on b54 b907 )
    ( clear b54 )
  )
  ( :goal
    ( and
      ( clear b521 )
    )
  )
)
