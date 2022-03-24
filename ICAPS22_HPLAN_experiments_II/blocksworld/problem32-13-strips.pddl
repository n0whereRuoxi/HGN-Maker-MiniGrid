( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b359 - block
    b128 - block
    b887 - block
    b191 - block
    b910 - block
    b572 - block
    b394 - block
    b861 - block
    b641 - block
    b891 - block
    b336 - block
    b728 - block
    b67 - block
    b11 - block
    b261 - block
    b296 - block
    b254 - block
    b390 - block
    b573 - block
    b902 - block
    b467 - block
    b586 - block
    b775 - block
    b916 - block
    b439 - block
    b912 - block
    b322 - block
    b15 - block
    b819 - block
    b903 - block
    b124 - block
    b58 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b359 b143 )
    ( on b128 b359 )
    ( on b887 b128 )
    ( on b191 b887 )
    ( on b910 b191 )
    ( on b572 b910 )
    ( on b394 b572 )
    ( on b861 b394 )
    ( on b641 b861 )
    ( on b891 b641 )
    ( on b336 b891 )
    ( on b728 b336 )
    ( on b67 b728 )
    ( on b11 b67 )
    ( on b261 b11 )
    ( on b296 b261 )
    ( on b254 b296 )
    ( on b390 b254 )
    ( on b573 b390 )
    ( on b902 b573 )
    ( on b467 b902 )
    ( on b586 b467 )
    ( on b775 b586 )
    ( on b916 b775 )
    ( on b439 b916 )
    ( on b912 b439 )
    ( on b322 b912 )
    ( on b15 b322 )
    ( on b819 b15 )
    ( on b903 b819 )
    ( on b124 b903 )
    ( on b58 b124 )
    ( clear b58 )
  )
  ( :goal
    ( and
      ( clear b143 )
    )
  )
)
