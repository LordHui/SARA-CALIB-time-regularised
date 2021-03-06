function [Psi, Psit] = SARA_sparse_operator(im, nlevel,opt)
    [C,S]=wavedec2(im,nlevel,'db8');
    ncoef=length(C);
    [C1,S1]=wavedec2(im,nlevel,'db1');
    ncoef1=length(C1);
    [C2,S2]=wavedec2(im,nlevel,'db2');
    ncoef2=length(C2);
    [C3,S3]=wavedec2(im,nlevel,'db3');
    ncoef3=length(C3);
    [C4,S4]=wavedec2(im,nlevel,'db4');
    ncoef4=length(C4);
    [C5,S5]=wavedec2(im,nlevel,'db5');
    ncoef5=length(C5);
    [C6,S6]=wavedec2(im,nlevel,'db6');
    ncoef6=length(C6);
    [C7,S7]=wavedec2(im,nlevel,'db7');
    ncoef7=length(C7);

if strcmp(opt, 'SARA') 
    Psit = @(x) [...
        wavedec2(x,nlevel,'db1')'; ...
        wavedec2(x,nlevel,'db2')'; ...
        wavedec2(x,nlevel,'db3')'; ...
        wavedec2(x,nlevel,'db4')'; ...
        wavedec2(x,nlevel,'db5')'; ...
        wavedec2(x,nlevel,'db6')'; ...
        wavedec2(x,nlevel,'db7')'; ...
        wavedec2(x,nlevel,'db8')'; ...
        x(:) ...
        ]/sqrt(9);
    Psi = @(x) (...
        waverec2(x(1:ncoef1),S1,'db1') + ...
        waverec2(x(ncoef1+1:ncoef1+ncoef2),S2,'db2') + ...
        waverec2(x(ncoef1+ncoef2+1:ncoef1+ncoef2+ncoef3),S3,'db3') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+1:ncoef1+ncoef2+ncoef3+ncoef4),S4,'db4') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5),S5,'db5') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6),S6,'db6') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7),S7,'db7') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+ncoef),S,'db8') + ...
        reshape(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+ncoef+1:end), size(im)) ...
        )/sqrt(9);
 
elseif strcmp(opt, 'SARA_par') 
    Psit{1} = @(x) wavedec2(x,nlevel,'db1')'/sqrt(9); 
    Psit{2} = @(x) wavedec2(x,nlevel,'db2')'/sqrt(9); 
    Psit{3} = @(x) wavedec2(x,nlevel,'db3')'/sqrt(9); 
    Psit{4} = @(x) wavedec2(x,nlevel,'db4')'/sqrt(9); 
    Psit{5} = @(x) wavedec2(x,nlevel,'db5')'/sqrt(9); 
    Psit{6} = @(x) wavedec2(x,nlevel,'db6')'/sqrt(9); 
    Psit{7} = @(x) wavedec2(x,nlevel,'db7')'/sqrt(9); 
    Psit{8} = @(x) wavedec2(x,nlevel,'db8')'/sqrt(9); 
    Psit{9} = @(x) x(:)/sqrt(9) ;
    Psi{1} = @(x) waverec2(x(1:ncoef1),S1,'db1')/sqrt(9) ;
    Psi{2} = @(x) waverec2(x(ncoef1+1:ncoef1+ncoef2),S2,'db2')/sqrt(9) ;
    Psi{3} = @(x) waverec2(x(ncoef1+ncoef2+1:ncoef1+ncoef2+ncoef3),S3,'db3')/sqrt(9) ;
    Psi{4} = @(x) waverec2(x(ncoef1+ncoef2+ncoef3+1:ncoef1+ncoef2+ncoef3+ncoef4),S4,'db4')/sqrt(9) ;
    Psi{5} = @(x) waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5),S5,'db5')/sqrt(9) ;
    Psi{6} = @(x) waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6),S6,'db6')/sqrt(9) ;
    Psi{7} = @(x) waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7),S7,'db7')/sqrt(9) ;
    Psi{8} = @(x) waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+ncoef),S,'db8')/sqrt(9) ;
    Psi{9} = @(x) reshape(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+ncoef+1:end), size(im))/sqrt(9);
 
elseif strcmp(opt, 'DB')
    Psit = @(x) [...
        wavedec2(x,nlevel,'db1')'; ...
        wavedec2(x,nlevel,'db2')'; ...
        wavedec2(x,nlevel,'db3')'; ...
        wavedec2(x,nlevel,'db4')'; ...
        wavedec2(x,nlevel,'db5')'; ...
        wavedec2(x,nlevel,'db6')'; ...
        wavedec2(x,nlevel,'db7')'; ...
        wavedec2(x,nlevel,'db8')' ...
        ]/sqrt(8);
    Psi = @(x) (...
        waverec2(x(1:ncoef1),S1,'db1') + ...
        waverec2(x(ncoef1+1:ncoef1+ncoef2),S2,'db2') + ...
        waverec2(x(ncoef1+ncoef2+1:ncoef1+ncoef2+ncoef3),S3,'db3') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+1:ncoef1+ncoef2+ncoef3+ncoef4),S4,'db4') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5),S5,'db5') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6),S6,'db6') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7),S7,'db7') + ...
        waverec2(x(ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+1:ncoef1+ncoef2+ncoef3+ncoef4+ncoef5+ncoef6+ncoef7+ncoef),S,'db8') ...
        )/sqrt(8);
 
elseif strcmp(opt, 'DB8')
    Psit = @(x) wavedec2(x,nlevel,'db8')' ;
    Psi  = @(x) waverec2(x,S,'db8') ;
 
elseif strcmp(opt, 'Haar')
    Psit = @(x) wavedec2(x,nlevel,'db2')' ;
    Psi  = @(x) waverec2(x,S2,'db2') ;
    
elseif strcmp(opt, 'Dirac')
    N_im = size(im) ;
    Psit = @(x) x(:) ;
    Psi  = @(x) reshape(x,N_im) ;
 
end
end