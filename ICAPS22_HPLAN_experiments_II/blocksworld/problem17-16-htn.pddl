( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b917 - block
    b888 - block
    b228 - block
    b197 - block
    b810 - block
    b988 - block
    b909 - block
    b854 - block
    b210 - block
    b979 - block
    b244 - block
    b711 - block
    b176 - block
    b863 - block
    b718 - block
    b143 - block
    b268 - block
    b614 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b917 )
    ( on b888 b917 )
    ( on b228 b888 )
    ( on b197 b228 )
    ( on b810 b197 )
    ( on b988 b810 )
    ( on b909 b988 )
    ( on b854 b909 )
    ( on b210 b854 )
    ( on b979 b210 )
    ( on b244 b979 )
    ( on b711 b244 )
    ( on b176 b711 )
    ( on b863 b176 )
    ( on b718 b863 )
    ( on b143 b718 )
    ( on b268 b143 )
    ( on b614 b268 )
    ( clear b614 )
  )
  ( :tasks
    ( Make-17Pile b888 b228 b197 b810 b988 b909 b854 b210 b979 b244 b711 b176 b863 b718 b143 b268 b614 )
  )
)
