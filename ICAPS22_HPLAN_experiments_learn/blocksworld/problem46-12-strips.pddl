( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b231 - block
    b744 - block
    b157 - block
    b505 - block
    b434 - block
    b722 - block
    b936 - block
    b800 - block
    b804 - block
    b660 - block
    b827 - block
    b51 - block
    b101 - block
    b867 - block
    b786 - block
    b79 - block
    b834 - block
    b769 - block
    b357 - block
    b48 - block
    b22 - block
    b272 - block
    b977 - block
    b958 - block
    b571 - block
    b693 - block
    b305 - block
    b912 - block
    b513 - block
    b589 - block
    b760 - block
    b292 - block
    b831 - block
    b922 - block
    b955 - block
    b253 - block
    b60 - block
    b905 - block
    b907 - block
    b974 - block
    b542 - block
    b550 - block
    b261 - block
    b909 - block
    b214 - block
    b144 - block
    b738 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b231 )
    ( on b744 b231 )
    ( on b157 b744 )
    ( on b505 b157 )
    ( on b434 b505 )
    ( on b722 b434 )
    ( on b936 b722 )
    ( on b800 b936 )
    ( on b804 b800 )
    ( on b660 b804 )
    ( on b827 b660 )
    ( on b51 b827 )
    ( on b101 b51 )
    ( on b867 b101 )
    ( on b786 b867 )
    ( on b79 b786 )
    ( on b834 b79 )
    ( on b769 b834 )
    ( on b357 b769 )
    ( on b48 b357 )
    ( on b22 b48 )
    ( on b272 b22 )
    ( on b977 b272 )
    ( on b958 b977 )
    ( on b571 b958 )
    ( on b693 b571 )
    ( on b305 b693 )
    ( on b912 b305 )
    ( on b513 b912 )
    ( on b589 b513 )
    ( on b760 b589 )
    ( on b292 b760 )
    ( on b831 b292 )
    ( on b922 b831 )
    ( on b955 b922 )
    ( on b253 b955 )
    ( on b60 b253 )
    ( on b905 b60 )
    ( on b907 b905 )
    ( on b974 b907 )
    ( on b542 b974 )
    ( on b550 b542 )
    ( on b261 b550 )
    ( on b909 b261 )
    ( on b214 b909 )
    ( on b144 b214 )
    ( on b738 b144 )
    ( clear b738 )
  )
  ( :goal
    ( and
      ( clear b231 )
    )
  )
)
