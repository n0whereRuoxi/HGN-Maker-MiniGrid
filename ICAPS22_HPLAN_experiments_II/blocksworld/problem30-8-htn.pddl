( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b470 - block
    b819 - block
    b464 - block
    b590 - block
    b382 - block
    b706 - block
    b767 - block
    b631 - block
    b329 - block
    b506 - block
    b468 - block
    b236 - block
    b306 - block
    b846 - block
    b695 - block
    b235 - block
    b324 - block
    b463 - block
    b768 - block
    b838 - block
    b179 - block
    b557 - block
    b776 - block
    b373 - block
    b873 - block
    b950 - block
    b509 - block
    b871 - block
    b300 - block
    b816 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b470 )
    ( on b819 b470 )
    ( on b464 b819 )
    ( on b590 b464 )
    ( on b382 b590 )
    ( on b706 b382 )
    ( on b767 b706 )
    ( on b631 b767 )
    ( on b329 b631 )
    ( on b506 b329 )
    ( on b468 b506 )
    ( on b236 b468 )
    ( on b306 b236 )
    ( on b846 b306 )
    ( on b695 b846 )
    ( on b235 b695 )
    ( on b324 b235 )
    ( on b463 b324 )
    ( on b768 b463 )
    ( on b838 b768 )
    ( on b179 b838 )
    ( on b557 b179 )
    ( on b776 b557 )
    ( on b373 b776 )
    ( on b873 b373 )
    ( on b950 b873 )
    ( on b509 b950 )
    ( on b871 b509 )
    ( on b300 b871 )
    ( on b816 b300 )
    ( on b3 b816 )
    ( clear b3 )
  )
  ( :tasks
    ( Make-30Pile b819 b464 b590 b382 b706 b767 b631 b329 b506 b468 b236 b306 b846 b695 b235 b324 b463 b768 b838 b179 b557 b776 b373 b873 b950 b509 b871 b300 b816 b3 )
  )
)
