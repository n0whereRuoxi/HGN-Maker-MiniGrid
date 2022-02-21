( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b198 - block
    b886 - block
    b440 - block
    b920 - block
    b867 - block
    b67 - block
    b910 - block
    b515 - block
    b828 - block
    b605 - block
    b50 - block
    b924 - block
    b29 - block
    b697 - block
    b913 - block
    b462 - block
    b63 - block
    b15 - block
    b204 - block
    b111 - block
    b839 - block
    b746 - block
    b950 - block
    b11 - block
    b92 - block
    b635 - block
    b776 - block
    b434 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b198 )
    ( on b886 b198 )
    ( on b440 b886 )
    ( on b920 b440 )
    ( on b867 b920 )
    ( on b67 b867 )
    ( on b910 b67 )
    ( on b515 b910 )
    ( on b828 b515 )
    ( on b605 b828 )
    ( on b50 b605 )
    ( on b924 b50 )
    ( on b29 b924 )
    ( on b697 b29 )
    ( on b913 b697 )
    ( on b462 b913 )
    ( on b63 b462 )
    ( on b15 b63 )
    ( on b204 b15 )
    ( on b111 b204 )
    ( on b839 b111 )
    ( on b746 b839 )
    ( on b950 b746 )
    ( on b11 b950 )
    ( on b92 b11 )
    ( on b635 b92 )
    ( on b776 b635 )
    ( on b434 b776 )
    ( clear b434 )
  )
  ( :goal
    ( and
      ( clear b198 )
    )
  )
)
