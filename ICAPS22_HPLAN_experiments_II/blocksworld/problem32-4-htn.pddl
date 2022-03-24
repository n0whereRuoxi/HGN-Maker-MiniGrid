( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b336 - block
    b930 - block
    b445 - block
    b470 - block
    b13 - block
    b728 - block
    b765 - block
    b970 - block
    b84 - block
    b543 - block
    b873 - block
    b899 - block
    b131 - block
    b514 - block
    b776 - block
    b164 - block
    b699 - block
    b183 - block
    b186 - block
    b768 - block
    b985 - block
    b605 - block
    b715 - block
    b628 - block
    b669 - block
    b563 - block
    b829 - block
    b434 - block
    b827 - block
    b836 - block
    b480 - block
    b65 - block
    b7 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b336 )
    ( on b930 b336 )
    ( on b445 b930 )
    ( on b470 b445 )
    ( on b13 b470 )
    ( on b728 b13 )
    ( on b765 b728 )
    ( on b970 b765 )
    ( on b84 b970 )
    ( on b543 b84 )
    ( on b873 b543 )
    ( on b899 b873 )
    ( on b131 b899 )
    ( on b514 b131 )
    ( on b776 b514 )
    ( on b164 b776 )
    ( on b699 b164 )
    ( on b183 b699 )
    ( on b186 b183 )
    ( on b768 b186 )
    ( on b985 b768 )
    ( on b605 b985 )
    ( on b715 b605 )
    ( on b628 b715 )
    ( on b669 b628 )
    ( on b563 b669 )
    ( on b829 b563 )
    ( on b434 b829 )
    ( on b827 b434 )
    ( on b836 b827 )
    ( on b480 b836 )
    ( on b65 b480 )
    ( on b7 b65 )
    ( clear b7 )
  )
  ( :tasks
    ( Make-32Pile b930 b445 b470 b13 b728 b765 b970 b84 b543 b873 b899 b131 b514 b776 b164 b699 b183 b186 b768 b985 b605 b715 b628 b669 b563 b829 b434 b827 b836 b480 b65 b7 )
  )
)
