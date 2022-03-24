( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b595 - block
    b885 - block
    b602 - block
    b793 - block
    b834 - block
    b38 - block
    b632 - block
    b148 - block
    b665 - block
    b918 - block
    b21 - block
    b292 - block
    b888 - block
    b738 - block
    b226 - block
    b412 - block
    b956 - block
    b807 - block
    b784 - block
    b651 - block
    b993 - block
    b750 - block
    b104 - block
    b711 - block
    b156 - block
    b534 - block
    b313 - block
    b152 - block
    b875 - block
    b332 - block
    b772 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b595 )
    ( on b885 b595 )
    ( on b602 b885 )
    ( on b793 b602 )
    ( on b834 b793 )
    ( on b38 b834 )
    ( on b632 b38 )
    ( on b148 b632 )
    ( on b665 b148 )
    ( on b918 b665 )
    ( on b21 b918 )
    ( on b292 b21 )
    ( on b888 b292 )
    ( on b738 b888 )
    ( on b226 b738 )
    ( on b412 b226 )
    ( on b956 b412 )
    ( on b807 b956 )
    ( on b784 b807 )
    ( on b651 b784 )
    ( on b993 b651 )
    ( on b750 b993 )
    ( on b104 b750 )
    ( on b711 b104 )
    ( on b156 b711 )
    ( on b534 b156 )
    ( on b313 b534 )
    ( on b152 b313 )
    ( on b875 b152 )
    ( on b332 b875 )
    ( on b772 b332 )
    ( clear b772 )
  )
  ( :tasks
    ( Make-30Pile b885 b602 b793 b834 b38 b632 b148 b665 b918 b21 b292 b888 b738 b226 b412 b956 b807 b784 b651 b993 b750 b104 b711 b156 b534 b313 b152 b875 b332 b772 )
  )
)
