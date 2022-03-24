( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b588 - block
    b460 - block
    b820 - block
    b404 - block
    b298 - block
    b890 - block
    b68 - block
    b981 - block
    b366 - block
    b674 - block
    b882 - block
    b637 - block
    b855 - block
    b541 - block
    b349 - block
    b800 - block
    b448 - block
    b175 - block
    b941 - block
    b917 - block
    b430 - block
    b60 - block
    b631 - block
    b723 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b588 )
    ( on b460 b588 )
    ( on b820 b460 )
    ( on b404 b820 )
    ( on b298 b404 )
    ( on b890 b298 )
    ( on b68 b890 )
    ( on b981 b68 )
    ( on b366 b981 )
    ( on b674 b366 )
    ( on b882 b674 )
    ( on b637 b882 )
    ( on b855 b637 )
    ( on b541 b855 )
    ( on b349 b541 )
    ( on b800 b349 )
    ( on b448 b800 )
    ( on b175 b448 )
    ( on b941 b175 )
    ( on b917 b941 )
    ( on b430 b917 )
    ( on b60 b430 )
    ( on b631 b60 )
    ( on b723 b631 )
    ( clear b723 )
  )
  ( :goal
    ( and
      ( clear b588 )
    )
  )
)
