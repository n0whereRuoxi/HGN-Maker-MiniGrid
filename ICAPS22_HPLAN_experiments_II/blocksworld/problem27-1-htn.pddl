( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b987 - block
    b498 - block
    b943 - block
    b583 - block
    b88 - block
    b736 - block
    b773 - block
    b824 - block
    b116 - block
    b382 - block
    b181 - block
    b758 - block
    b403 - block
    b767 - block
    b796 - block
    b290 - block
    b795 - block
    b744 - block
    b138 - block
    b674 - block
    b345 - block
    b917 - block
    b210 - block
    b248 - block
    b636 - block
    b632 - block
    b700 - block
    b166 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b987 )
    ( on b498 b987 )
    ( on b943 b498 )
    ( on b583 b943 )
    ( on b88 b583 )
    ( on b736 b88 )
    ( on b773 b736 )
    ( on b824 b773 )
    ( on b116 b824 )
    ( on b382 b116 )
    ( on b181 b382 )
    ( on b758 b181 )
    ( on b403 b758 )
    ( on b767 b403 )
    ( on b796 b767 )
    ( on b290 b796 )
    ( on b795 b290 )
    ( on b744 b795 )
    ( on b138 b744 )
    ( on b674 b138 )
    ( on b345 b674 )
    ( on b917 b345 )
    ( on b210 b917 )
    ( on b248 b210 )
    ( on b636 b248 )
    ( on b632 b636 )
    ( on b700 b632 )
    ( on b166 b700 )
    ( clear b166 )
  )
  ( :tasks
    ( Make-27Pile b498 b943 b583 b88 b736 b773 b824 b116 b382 b181 b758 b403 b767 b796 b290 b795 b744 b138 b674 b345 b917 b210 b248 b636 b632 b700 b166 )
  )
)
