( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b45 - block
    b396 - block
    b218 - block
    b811 - block
    b425 - block
    b825 - block
    b105 - block
    b118 - block
    b38 - block
    b817 - block
    b939 - block
    b477 - block
    b586 - block
    b257 - block
    b547 - block
    b613 - block
    b828 - block
    b190 - block
    b864 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b45 )
    ( on b396 b45 )
    ( on b218 b396 )
    ( on b811 b218 )
    ( on b425 b811 )
    ( on b825 b425 )
    ( on b105 b825 )
    ( on b118 b105 )
    ( on b38 b118 )
    ( on b817 b38 )
    ( on b939 b817 )
    ( on b477 b939 )
    ( on b586 b477 )
    ( on b257 b586 )
    ( on b547 b257 )
    ( on b613 b547 )
    ( on b828 b613 )
    ( on b190 b828 )
    ( on b864 b190 )
    ( clear b864 )
  )
  ( :goal
    ( and
      ( clear b45 )
    )
  )
)
