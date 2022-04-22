( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b200 - block
    b931 - block
    b972 - block
    b928 - block
    b740 - block
    b437 - block
    b652 - block
    b375 - block
    b710 - block
    b281 - block
    b840 - block
    b161 - block
    b448 - block
    b156 - block
    b144 - block
    b574 - block
    b848 - block
    b377 - block
    b169 - block
    b25 - block
    b554 - block
    b582 - block
    b20 - block
    b378 - block
    b498 - block
    b13 - block
    b981 - block
    b536 - block
    b223 - block
    b267 - block
    b80 - block
    b655 - block
    b322 - block
    b784 - block
    b320 - block
    b542 - block
    b626 - block
    b216 - block
    b936 - block
    b23 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b200 )
    ( on b931 b200 )
    ( on b972 b931 )
    ( on b928 b972 )
    ( on b740 b928 )
    ( on b437 b740 )
    ( on b652 b437 )
    ( on b375 b652 )
    ( on b710 b375 )
    ( on b281 b710 )
    ( on b840 b281 )
    ( on b161 b840 )
    ( on b448 b161 )
    ( on b156 b448 )
    ( on b144 b156 )
    ( on b574 b144 )
    ( on b848 b574 )
    ( on b377 b848 )
    ( on b169 b377 )
    ( on b25 b169 )
    ( on b554 b25 )
    ( on b582 b554 )
    ( on b20 b582 )
    ( on b378 b20 )
    ( on b498 b378 )
    ( on b13 b498 )
    ( on b981 b13 )
    ( on b536 b981 )
    ( on b223 b536 )
    ( on b267 b223 )
    ( on b80 b267 )
    ( on b655 b80 )
    ( on b322 b655 )
    ( on b784 b322 )
    ( on b320 b784 )
    ( on b542 b320 )
    ( on b626 b542 )
    ( on b216 b626 )
    ( on b936 b216 )
    ( on b23 b936 )
    ( clear b23 )
  )
  ( :goal
    ( and
      ( clear b200 )
    )
  )
)
