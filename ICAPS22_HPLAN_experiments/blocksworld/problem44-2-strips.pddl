( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b404 - block
    b585 - block
    b261 - block
    b340 - block
    b329 - block
    b742 - block
    b947 - block
    b810 - block
    b838 - block
    b63 - block
    b730 - block
    b579 - block
    b626 - block
    b922 - block
    b611 - block
    b758 - block
    b788 - block
    b205 - block
    b602 - block
    b233 - block
    b732 - block
    b170 - block
    b38 - block
    b616 - block
    b792 - block
    b27 - block
    b544 - block
    b265 - block
    b934 - block
    b139 - block
    b49 - block
    b586 - block
    b151 - block
    b977 - block
    b96 - block
    b726 - block
    b219 - block
    b478 - block
    b675 - block
    b725 - block
    b430 - block
    b372 - block
    b397 - block
    b231 - block
    b203 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b404 )
    ( on b585 b404 )
    ( on b261 b585 )
    ( on b340 b261 )
    ( on b329 b340 )
    ( on b742 b329 )
    ( on b947 b742 )
    ( on b810 b947 )
    ( on b838 b810 )
    ( on b63 b838 )
    ( on b730 b63 )
    ( on b579 b730 )
    ( on b626 b579 )
    ( on b922 b626 )
    ( on b611 b922 )
    ( on b758 b611 )
    ( on b788 b758 )
    ( on b205 b788 )
    ( on b602 b205 )
    ( on b233 b602 )
    ( on b732 b233 )
    ( on b170 b732 )
    ( on b38 b170 )
    ( on b616 b38 )
    ( on b792 b616 )
    ( on b27 b792 )
    ( on b544 b27 )
    ( on b265 b544 )
    ( on b934 b265 )
    ( on b139 b934 )
    ( on b49 b139 )
    ( on b586 b49 )
    ( on b151 b586 )
    ( on b977 b151 )
    ( on b96 b977 )
    ( on b726 b96 )
    ( on b219 b726 )
    ( on b478 b219 )
    ( on b675 b478 )
    ( on b725 b675 )
    ( on b430 b725 )
    ( on b372 b430 )
    ( on b397 b372 )
    ( on b231 b397 )
    ( on b203 b231 )
    ( clear b203 )
  )
  ( :goal
    ( and
      ( clear b404 )
    )
  )
)
